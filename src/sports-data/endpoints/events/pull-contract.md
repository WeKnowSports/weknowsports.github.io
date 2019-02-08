# Event

```json
type Event = {
    id: string
    type: string
    sportId: string
    sportName: string
    sportOrder: number
    regionId: string
    regionCode: string
    regionName: string
    leagueId: string
    leagueName: string
    leagueOrder: number
    isTopLeague: boolean
    participants: Participant[] // Described in a separate table below.
    eventName: string
    betslipLine: string
    totalMarketsCount: number
    marketLinesCount: number
    marketGroups: MarketGroup[] // Described in a separate table below.
    startEventDate: ISODateTimeString
    status: string
    score: GameScore | null // Described in a separate table below.
    isLive: boolean
    isGoingLive: boolean
    liveGameState?: LiveGameState // Described in a separate table below.
    isTeamSwap: boolean
    isSuspended: boolean
    tags: string[] // Described in a separate table below.
    entityType: EntityType
    media?: MediaProvider[] // Described in a separate table below.
    metadata: Dictionary<any> // Described in a separate table below.
}
```

| Name | Description | Format | Returnable | Queryable | Example |
| --- | ----------- | --- | --- | --- | ----- |
| id | Specifies the identifier of the sports event. | string | Yes | query (using eq, ne, or, and, in) | $filter=Id eq '11754652' |
| entityType | Specifies the type of the entity. Always 0 for events. | number | Yes | No | -- |
| type | Specifies the type of the sports event. Possible values are "Fixture" and "Outright" for most sports and "AntePostRace" and "DayOfEventRace" for racing sports. | string | Yes | query (using eq, ne, or, and, in) | $filter=type eq (ne) 'Fixture' |
| sportId | Specifies the identifier of the sport. | string | Yes | query (using eq, ne, or, and, in) | $filter=sportId eq (ne) '12' |
| sportName | Specifies the name of the sport (translated). | string | Yes | query (using eq, ne, or, and, in) | $filter=sportName eq 'Soccer' |
| sportOrder | Specifies the sorting order of the sport. | number | Yes | $orderby (only *asc*) | $orderby=sportOrder asc |
| regionId | Specifies the identifier of the region. | string | Yes | query (using eq, ne, or, and, in) | $filter=regionId eq '260' |
| regionCode | Specifies ISO country code or (for regions in country) region code. | string | Yes | query (using eq, ne, or, and, in) | $filter=regionCode eq 'EN' |
| regionName | Specifies the name of the region. | string | Yes | query (using eq, ne, or, and, in) | $filter=regionName eq 'England' |
| leagueId | Specifies the identifier of the league. | string | Yes | query (using eq, ne, or, and, in) | $filter=leagueId eq '36690' |
| leagueName | Specifies the name (translated) of the league. | string | Yes | query (using eq, ne, or, and, in) | $filter=leagueName eq 'English Football League Cup' |
| leagueOrder | Specifies the sorting order of the league. | number | Yes | (using eq, ne, or, and, in) | $filter=leagueOrder eq 580150 |
| isTopLeague | Specifies if the league is marked with a top flag. | Boolean | Yes | query (using eq, ne) | $filter=isTopLeague eq false |
| participants | Specifies the participants in the event. Parameters of the Participant object are described in a separate table below. | Array | Yes | query (using lambda, eq, ne, or, and, in) | $filter=participants/any(p: p/id eq '357') |
| eventName | Specifies the name of the event. For events of type "Fixture" it is composed of participants name, e.g. "ParticipantHome vs ParticipantAway". Order of teams is reversed if `swapTeams: true`. If you want, you can ignore this value and compose it locally in a different format. | string | Yes | query (using eq, ne, or, and, in) | $filter=eventName eq 'Chelsea vs Bournemouth' |
| betslipLine | Specifies the presentation of the event in the bet slip in the context of each of its selections. To be used in conjunction with the respective `Market.selections[].betslipLine` and `Market.betslipLine` values.| string | Yes | query (using eq, ne, or, and, in) | $filter=betslipLine eq 'Clonmel: 12:15' |
| marketGroups | Specifies the market groups defined within the event. | MarketGroup | Yes | query (using lambda, eq, ne, or, and, in) 
Сan't query this together with marketTypes.| $filter=marketGroups/any(p: p/name eq 'Corners') |
| totalMarketsCount | Specifies the total markets count. Not affected by the IncludeMarkets filter, i.e. always returns the total count of available markets for the event. | number | Yes | $orderby (only desc) | $orderby=totalMarketsCount desc |
| marketLinesCount | Specifies the total number of markets, with point lines counted as separate markets. Not affected by the IncludeMarkets filter, i.e. always returns the total count of available markets for the event. | number | Yes | query (using lambda, eq, ne, or, and, in) | $filter=marketLinesCount eq 0 |
| totalBets | Number of bets placed for entity. | number | No | $orderby (only desc) | $orderby=totalBets desc |
| totalDeposit | Total deposit of all bets placed for entity. | number | No | $orderby (only asc) | $orderby=startEventDate asc |
| startEventDate | Specifies the date and time of the beginning of the event. | ISODateTimeString | Yes | $orderby (only asc) | $orderby=startEventDate asc |
| status | Specifies the status of the event. Possible values are "NotStarted", "InProgress" (for most sports), "RaceOff" (for racing sports), "Resulted" (supported only for racing sports got now; events from other sports will be removed before moving into this status). | string | Yes | query (using eq, ne, or, and, in) | $filter=status eq 'NotStarted' |
| score |	Specifies the current score of the event. | GameScore |	Yes | query (using lambda, eq, ne, or, and, in) | $filter=score/awayScore eq '0' |
| isLive | Specifies if the event is currently traded live. | Boolean | Yes | query (using eq, ne) | $filter=isLive eq false |
| isGoingLive | Specifies if the event is going live when started, can be true for pre-match events only. | Boolean | Yes | query (using eq, ne) | $filter=isGoingLive eq false |
| liveGameState |	Specifies additional information on the event such as status, score, current time. See all parameters in a table below. | LiveGameState | Yes | query (using lambda, eq, ne, or, and, in) | $filter=liveGameState/gamePart eq 'SecondHalf' |
| tags | Specifies additional information on the event. | string | Yes |	query (using lambda, eq, ne, or, and, in) | $filter=tags/any(s: s eq 'LiveStream') |
| media |	Specifies list of available mapping data to external media providers for the event, such us live streaming, statistics, match tracker widgets etc. | Media | Yes | query (using lambda, eq, ne, or, and, in) | $filter=media/any(p: p/mediaType eq 'LiveStreaming') |
| metadata | Specifies additional information on the event. | string | Yes | No | -- |
| isSuspended | Specifies if the event is suspended. | boolean | Yes | query (using eq, ne) | $filter=isSuspended eq false |
| isTeamSwap | Specifies if the suggested presentation of the event implies to show the away team first. Relevant only for Fixture events. | boolean | Yes	| query (using eq, ne) | $filter=isTeamSwap eq false |

## Participant
 
```json
type Participant = {
    id: string
    name: string
    venueRole?: VenueRole
    country: string
    metadata: Dictionary<any> 
}
```
 
| Name | Description | Format | Queryable | Returnable |
| --- | --- | --- | --- | --- |
|id| Specifies the identifier of the participant. | string | Yes | Yes |
|name| Specifies the name of the participant. | string | Yes | Yes |
|venueRole| Specifies the relation of the participant to the venue (home or away). Note that these will follow the customary designations, but in some cases could be fictitious. Also, no value will be assigned to participants in Outright events, even if one or more participants are considered to be competing on their "home" ground. This parameter is mostly intended to be used as a display signal for Fixture events. | VenueRole: Home or Away | Yes | Yes |
|country| Specifies the ISO code of the country. | String | Yes | Yes |
|metadata| Specifies additional information on the participant, such as runnerNumber: number, imageUrl: string, weight: string, age: number. | Dictionary |	Yes | Yes |



### Participant.metadata for Horse racing events

Possible `Event.Participant.metadata` dictionary entries for Horse racing events

| Parameter | Description | Format | Queryable | Returnable |
| --- | --- | --- | --- | --- |
|age| Specifies the horse's rage. | string | No | Yes |
|form| Specifies the horse's "form" information, when available. | string | No | Yes |
|jockey| Specifies the name of the jockey. | string | No | Yes |
|trainer| Specifies the name of the trainer. | string | No | Yes |
|runnerNumber| Specifies the "runner number" of the horse. | string | No  | Yes |
|stallNumber| Specifies the number of the stall from which the horse will start the race. | string | No | Yes |
|weight| Specifies the horse's weight. | string | No | Yes |
|runnerStatus| Specifies the horse's runner status. Possible values are “Ante-post” (for horses participating in an Ante-post race), “DOE” (for horses participating in a DOE race), “NR” (for horses withdrawn from the race). | string | No | Yes |
|paFeedId| Specifies the PA ID of a horse. | string | No | Yes |
|iconUrl| Populated only for participants in racing events for now. Specifies the URL from which to fetch the silk icon for a horse or the trap icon for a hound. | string | No | Yes |
|resultingPosition| Specifies the position of every participant after a racing event has resulted. | string | No | Yes |
|resultingStartingPrice| States the starting price of the participant at the start of the event, used to settle the "starting price" bets. Always provided in fractional odds. | string | No | Yes |
|rule4| "Rule 4" statement for the horse, if it becomes non-runner. | string | No | Yes |
|rpr| Horse rating, as provided by Racing post. | string | No | Yes |
|rpDiomedComment| The race prediction for a horse, as provided by Racing post. | string | No | Yes |


### Participant.metadata  for Greyhounds events

Possible Event.Participant.metadata dictionary entries for Greyhounds events

| Parameter | Description | Format | Queryable | Returnable |
| --- | --- | --- | --- | --- |
|trapNumber| Specifies the trap number of the hound. | string |	No | Yes |
|runnerStatus| Specifies the horse's runner status. Possible values are “Ante-post” (for hounds participating in an Ante-post race), “DOE” (for hounds participating in a DOE race), “NR” (for hounds withdrawn from the race). | string | No | Yes |
|paFeedId| Specifies value provided by the PA feed. | string |	No | Yes |
|iconUrl| Populated only for participants in racing events for now. Specifies the URL from which to fetch the silk icon for a horse or the trap icon for a hound. | string | No | Yes |
|resultingPosition| Specifies the position of every participant after a racing event has resulted. | string | No | Yes |
|resultingStartingPrice| States the starting price of the participant at the start of the event, used to settle the “starting price” bets. Always provided in fractional odds. | string |No | Yes |
|rpDiomedComment| The race prediction for a horse, as provided by Racing post. | string | No | Yes |



## LiveGameState

```json
type LiveGameState = {
    clockRunning: Boolean
    clockDirection: string
    gameTime: number //In seconds
    gamePart: string
}
```

| Parameter | Description | Format | Queryable | Returmable |
| --- | --- | --- | --- | -- |
|clockRunning| Specifies if the in-game clock is currently running. | Boolean | Yes | Yes |
|clockDirection| Specifies the clock direction. Two values are possible: "Stopwatch" (default, counting starts from 0 and continues until the clock is reset or the game ends) and "Timer" (counting starts from some specific value and goes down to 0) | string | Yes | Yes |
|gameTime| Specifies the current in-game time in seconds. Note that presentation needs might differ depending on the sport. | number | Yes | Yes |
|gamePart| Specifies the current part of the game. Note that this will differ per sport. | string | Yes	| Yes |


### Possible Event.LiveGameState.gamePart values per sport

_NB: These values are intended as keys or identifiers, not as display values. They are not localised and they cannot be modified to serve specific display needs (like full or shortened/abbreviated presentation). Such issues have to be addressed client side._


#### Soccer

FirstHalf
BreakAfterFirstHalf
SecondHalf
Overtime
<!--
FirstOvertime
BreakAfterFirstOvertime
SecondOvertime
-->

#### Basketball

FirstQuarter
BreakAfterFirstQuarter
SecondQuarter
BreakAfterSecondQuarter
ThirdQuarter
BreakAfterThirdQuarter
FourthQuarter
BreakAfterFourthQuarter
FirstOvertime
BreakAfterFirstOvertime
SecondOvertime

#### Tennis

FirstSet
SecondSet
ThirdSet
FourthSet
FifthSet

#### Handball

FirstHalf
BreakAfterFirstHalf
SecondHalf

#### Ice hockey

FirstPeriod
BreakAfterFirstPeriod
SecondPeriod
BreakAfterSecondPeriod
ThirdPeriod
BreakAfterThirdPeriod
Overtime

#### American Football

FirstQuarter
BreakAfterFirstQuarter
SecondQuarter
BreakAfterFirstHalf
ThirdQuarter
BreakAfterThirdQuarter
FourthQuarter
BreakAfterFourthQuarter
Overtime

#### Rugby League

FirstHalf
BreakAfterFirstHalf
SecondHalf

#### Rugby Union

FirstHalf
BreakAfterFirstHalf
SecondHalf
<br>
#### Volleyball

FirstSet
SecondSet
ThirdSet
FourthSet
FifthSet



## MarketGroup

```json
type MarketGroup = {
    id: string
    name: string
    order: number
}
```

| Parameter | Description | Format | Queryable | Returnable |
| --- | --- | --- | --- | --- |
|id| Specifies the identifier of the group. Will be referred from the [[Markets]] to help organize the layout of the event view. | string | Yes | Yes |
|name| Specifies the name of the group. Note that this field is currently NOT localized. | string | Yes | Yes |
|order| Specifies the order key for the group. | number | No | Yes |



## GameScore

```json
type GameScore = {
    homeScore: string
    awayScore: string
    combinedSecondTierScores: array
    additionalScores: Dictionary<any>
}
```

| Parameter | Description | Format | Queryable | Returmable |
| --- | --- | --- | --- | --- |
|homeScore| Specifies the score for the home team. Only a single value, representing the "main" score for the respective sport will be included. Usually, this would be the total number of points or goals for the respective team. For tennis the value will represent total sets won. For cricket the value will represent the "runs for wickets" score of the team. | string | Yes | Yes |
|awayScore| Specifies the score for the away team. Same general format as @scoreHome@. | string | Yes |	Yes |
|combinedSecondTierScores| Will include an array of "second tier" (usually game part) scores. Facilitates displaying comprehensive score on coupon views. | array | Yes | Yes |
|additionalScores| Provides a list of additional scores, e.g. per game part. Specific per sport. | Dictionary | Yes | Yes |


### Possible "AdditionalScores" properties per sport

Below is a list of possible parameters which will appear under the additionalScores dictionary, depending on the sport of the event. A few general patterns and rules have to be taken into account:
- All values are in *string* format.
- Almost all properties will have an appendix or 1 or 2 in the name. These indicate score for the Home or Away team, respectively. For example, `FirstHalfScore1` is the score of the Home team for the first half of a soccer game.
- The only exception is the `onServe" property, which will appear for several sports and will have a _value_ of 1 or 2. The pattern is the same -- `onServe: 1` for a Volleyball game means that the Home team is serving. We use the `onServe` parameter also for Baseball and Cricket events to allow easier, more generalised implementation, realising that it is not the correct technical term.
- Not all properties will be always returned. Missing pair of properties means that there is no score of the respective game part or (in rare cases) that we don't have the respective data. For example, during the third quarter of a basketball game, we will not return `BasketballFourthQuarterScore1` and `BasketballFourthQuarterScore2` parameters.

#### Soccer

- FirstHalfScore1
- FirstHalfScore2
- SecondHalfScore1
- SecondHalfScore2
- ExtraTimeScore1
- ExtraTimeScore2
- YellowCardsTeam1
- YellowCardsTeam2
- RedCardsTeam1
- RedCardsTeam2
- CornersTeam1
- CornersTeam2
- PenaltiesTeam1
- PenaltiesTeam2

#### Basketball

- BasketballFirstQuarterScore1
- BasketballFirstQuarterScore2
- BasketballSecondQuarterScore1
- BasketballSecondQuarterScore2
- BasketballFirstHalfScore1
- BasketballFirstHalfScore2
- BasketballThirdQuarterScore1
- BasketballThirdQuarterScore2
- BasketballFourthQuarterScore1
- BasketballFourthQuarterScore2
- BasketballSecondHalfScore1
- BasketballSecondHalfScore2
- BasketballResultType
- InputForPeriod
- BasketballOverTimeScore1
- BasketballOverTimeScore2

#### Tennis

- onServe
- FirstSetScore1
- FirstSetScore2
- SecondSetScore1
- SecondSetScore2
- ThirdSetScore1
- ThirdSetScore2
- FourthSetScore1
- FourthSetScore2
- FifthSetScore1
- FifthSetScore2
- CurrentGameScore1
- CurrentGameScore2

#### American Football

- AmericanFootball1QScore1
- AmericanFootball1QScore2
- AmericanFootball2QScore1
- AmericanFootball2QScore2
- AmericanFootball3QScore1
- AmericanFootball3QScore2
- AmericanFootball4QScore1
- AmericanFootball4QScore2
- AmericanFootball1HScore1
- AmericanFootball1HScore2
- AmericanFootball2HScore1
- AmericanFootball2HScore2

#### Baseball

- onServe
- FirstInningScore1
- FirstInningScore2
- SecondInningScore1
- SecondInningScore2
- ThirdInningScore1
- ThirdInningScore2
- FourthInningScore1
- FourthInningScore2
- FifthInningScore1
- FifthInningScore2
- SixthInningScore1
- SixthInningScore2
- SeventhInningScore1
- SeventhInningScore2
- EighthInningScore1
- EighthInningScore2
- NinthInningScore1
- NinthInningScore2

#### Ice hockey

- IceHockeyFirstPeriodScore1
- IceHockeyFirstPeriodScore2
- IceHockeySecondPeriodScore1
- IceHockeySecondPeriodScore2
- IceHockeyThirdPeriodScore1
- IceHockeyThirdPeriodScore2

#### Volleyball

- onServe
- VolleyballFirstSetScore1
- VolleyballFirstSetScore2
- VolleyballSecondSetScore1
- VolleyballSecondSetScore2
- VolleyballThirdSetScore1
- VolleyballThirdSetScore2
- VolleyballFourthSetScore1
- VolleyballFourthSetScore2
- VolleyballFifthSetScore1
- VolleyballFifthSetScore2

#### Aussie rules

- AussieRules1HScore1
- AussieRules1HScore2
- AussieRules2HScore1
- AussieRules2HScore2
- AussieRules1QScore1
- AussieRules1QScore2
- AussieRules1QGoalScore1
- AussieRules1QGoalScore2
- AussieRules1QBehinds1
- AussieRules1QBehinds2
- AussieRules2QScore1
- AussieRules2QScore2
- AussieRules2QGoalScore1
- AussieRules2QGoalScore2
- AussieRules2QBehinds1
- AussieRules2QBehinds2
- AussieRules3QScore1
- AussieRules3QScore2
- AussieRules3QGoalScore1
- AussieRules3QGoalScore2
- AussieRules3QBehinds1
- AussieRules3QBehinds2
- AussieRules4QScore1
- AussieRules4QScore2
- AussieRules4QGoalScore1
- AussieRules4QGoalScore2
- AussieRules4QBehinds1
- AussieRules4QBehinds2
- AussieRulesGoalScoreTotal1
- AussieRulesBehindsTotal1
- AussieRulesGoalScoreTotal2
- AussieRulesBehindsTotal2

#### Rugby league

- RugbyLeague1HScore1
- RugbyLeague1HScore2
- RugbyLeague2HScore1
- RugbyLeague2HScore2
- RugbyLeagueTriesFTScore1
- RugbyLeagueTriesFTScore2
- RugbyLeagueTries1HScore1
- RugbyLeagueTries1HScore2
- RugbyLeagueTries2HScore1
- RugbyLeagueTries2HScore2

#### Cricket

- onServe



## Tags

| Name | Description |
| --- | --- |
|Stats| Integration with statistics provider is available for the event. |
|LiveStream| Integration with live streaming provider is available for the event. |
|MatchTracker| MatchTracker widget is switched on for the event. |
|Scoreboard| Scoreboard widget is switched on for the event. |
|ToteGreyhounds| For Tote events, that have Greyhound trackType. |
|ToteHarness| For Tote events, that have Harness trackType. |
|ToteHorses| For Tote events, that haven't Greyhound or Harness trackType. |
|USRace| The event is with US region. |
|FastMarket| Fast markets are available for the event. |
|Pulse| Pulse markets are available for the event. |
|BestOddsGuaranteed| BOG parameter is activated for the event. |
|Vidiprinter| Specifies availability vidiprinter/incidents feed for a given event. |



## Media

```json
type Media = {
    providerName: string
    mediaType: string
    providerEventId: string
}
```

| Name | Description | Format | Returnable | Queryable |
| --- | --- | --- | --- | --- |
|providerName| Specifies the provider for the mapping information. | string | Yes | Yes |
|mediaType| Specifies the type of media content being mapped. | string | Yes | Yes |
|providerEventId| Specifies the provider ID for this event to allow mapping to the respective provider content. | string | Yes | No |


### Possible `providerName` values

These are providers for which mapping data is currently supported in the SBTech system. Note that access to data linked to the listed providers is usually subject to additional licencing agreements. Data will be served in the API only if these are cleared and access to this content is activated in the SBTech system for the respective operator.
- ATRWB
- BetRadarStats
- BetRadar
- IMG
- Perform
- RacingUKWB
- Unas
- UnasMobile

### Possible `mediaType` values

| Name | Description |
| --- | --- |
|Stats| Integration with statistics provider is available for the event. |
|LiveStreaming| Integration with live streaming provider is available for the event. |
|MatchTracker| MatchTracker widget is switched on for the event. |
|Scoreboard| Scoreboard widget is switched on for the event. |
|Vidiprinter| Specifies availability vidiprinter/incidents feed for a given event. |



## Metadata

| Parameter | Description | Format | Returnable | Queryable |
| --- | --- | --- | --- | --- |
|tennisMatchtype| Indicates the format of a tennis match. Possible values are 3 and 5. | String | Yes | No |
|tennisLastSetIsAdvantageSet| Indicates if the last set of a tennis match is an advantage set. Possible values are 0 (false) and 1 (true). | String | Yes | No |
|tennisSurface| Indicates Indicates the surface of the tennis match. Possible values are 0 (unknown surface), 1 (carpet court), 2 (clay court), 3 (hard court), 4 (grass court). | String | Yes | No |
|BoxingNumberOfRounds| Indicates the number of rounds in boxing events. Default is 12, can return custom value. | String | Yes | No |
|secondsInOnePart| Will be served for soccer and basketball games and define the length of a part (half and quartner, respectively). | String | Yes | No |
|numberOfParts| For some sport, will define the number of game parts. | String | Yes | No |
|raceHour| For racing events only, the race hour in UTC. | String | Yes | No |
|raceGoing| "Going" statement for a racing event. | String | Yes | No |
|forecastResult| Presentation of the Forecast result for a racing event. Provided after the race finish. Format will be like "2-4", where the digits represent the runner number of the participants in the order in which they finished the race. | String | Yes | No |
|tricastResult| Presentation of the Tricast result for a racing event. Provided after the race finish. Format will be like "2-4-1", where the digits represent the runner number of the participants in the order in which they finished the race. | String | Yes | No |
|forecastDividend| The dividend used to settle Forecast bets for a racing event. | String | Yes | No |
|tricastDividend| The dividend used to settle Tricast bets for a racing event. |String | Yes | No |
|rpRaceDistance| For racing events only, the race distance, as provided by Racing post. | String | Yes | No |
|rpRaceType| For racing events only, the race type, as provided by Racing post. | String | Yes | No |
|rpDiomedVerdict| For racing events only, the race description, as provided by Racing post. | String | Yes | No |

