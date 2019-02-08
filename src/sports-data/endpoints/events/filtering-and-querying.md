# Filtering and querying Events

## HTTP parameter: query

| Option | Example | Description |
| --- | --- | --- |
|$filter|$filter=sportId eq '12'|Allows clients to filter a collection of resources that are addressed by a request URL.|
|$top|$top=10|The $top system query option requests the number of items in the queried collection to be included in the result.
*100* is max value.|
|$skip|$skip=3|The $skip query option requests the number of items in the queried collection that are to be skipped and not included in the result.|
|$orderby|$orderby=totalMarketsCount desc 
$orderby=sportOrder asc| The $orderby system query option allows clients to request resources in either ascending order using asc or descending order using desc. If asc or desc not specified, then the resources will be ordered in ascending order.|
|  |All available 2 fields ordering variants:
- startEventDate asc, then leagueOrder asc
- startEventDate asc, then totalMarketsCount desc
- startEventDate asc, then totalBets desc
- startEventDate asc, then totalDeposit desc|We can **sort only by 1 or max 2** fields.|

## Time range queries

| Option | Example | Description |
| --- | --- | --- |
|from|from=2018-02-28|When 'from' field is not empty, we should specify the value of 'timerange'.|
|timeRange|timeRange=SixHours|	The timeRange query option requests the data for specified period.
*Possible values:* OneHour, TwoHours, ThreeHours, SixHours, TwelveHours, OneDay, TwoDays, ThreeDays, FourDays, FiveDays, SixDays, SevenDays |

## HTTP parameter: includeMarkets

| Option | Example | Description |
| --- | --- | --- |
| empty | includeMarkets= | If the includeMarkets query is empty, it'll return the events with the list of "Default" type markets. |
| none | includeMarkets=none | If the includeMarkets query has value 'none',  this query'll return only the events with the empty list of  markets. |
| empty filter | includeMarkets=$filter= | If the includeMarkets query has value '$filter=',  this query'll return the events with all the list of markets. |
| marketType | includeMarkets=$filter=marketType/id eq '1_0' | You'll receive the events and the markets with needed value of market type parameter ('id', 'name' or 'isCastMarket'). |
| market.tags | includeMarkets=$filter=Tags/any(s: s eq 'Default') |  |
| *Attention!* | includeMarkets=marketType/id eq '1_39' or marketType/name eq 'Live Betting 1X2’ | Combinations of includeMarkets options is is forbidden |


## HTTP parameter: projection (only for Pull API)

| Option | Example | Description |
| --- | --- | --- |
| projection | projection=onlyid | With such query, the response should contain only ids |
|  | projection=compact | With such query, the response should contains all the parameters in the usual Events contract without Participants, Metadata and MarketGroup properties. |


## HTTP parameter: count (only for Pull API)

| Option | Example | Description |
| --- | --- | --- |
| count | count=true | Calculates count to corresponding top and skip values (OData operator like $orderBy is ignored and not applied). |
|  | count=false | By default. It doesn't make any impact on the response. |

##  

| Option | Description | Example | Value Type |
| --- | --- | --- | --- |
| in | in | $filter=sportId in (‘1’,'2') | string |
| eq | Equal | $filter=sportId eq '1' | boolean, string, int |
| ne | Not equal | $filter=sportId ne ‘1’ | boolean, string, int |
| and | Logical and | $filter=sportId eq ‘1’ and leagueId eq ‘13761’ | boolean, string, int |
| or | Logical or | $filter=sportId eq ‘1’ or sportId eq ‘5’ | boolean, string, int |
