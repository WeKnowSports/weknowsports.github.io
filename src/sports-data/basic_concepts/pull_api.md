## Pull API

The Pull API should be used to query data, to retrieve an initial snapshot of data. For defining a query the API use OData as a query format (more info about OData supports you can find here).
With Pull API you can build complex OData query since it supports operators like: **Top, Skip, OrderBy** which is not supported in Push API.

> Any OData query should be URL encoded before being sent. Note that we will not encode the samples in this documentation to improve readability, but you should remember to do it consistently in your code.

URL path structure:
```http
GET /api/sportsdata/v2/{entity}/?query=...&locale=...
```

Possible entities:
- events
- markets
- selections
- sports
- leagues
- regions

Parameters:
- **query** (mandatory) - the URL encoded target OData query. Here is a list of supported OData operators:
    - **$filter** - allows clients to filter a collection of resources that are addressed by a request URL. 
    - **$top** - number of items in the queried collection to be included in the result. 
    - **$skip** - number of items in the queried collection that are to be skipped and not included in the result.
    - **$orderBy** - allows clients to request resources in either ascending order using asc or descending order using desc.
- **from** (optional)
- **timeRange** (optional)
- **includeMarkets** (optional) - the URL encoded additional OData query to include markets for events (*could be used only for Events endpoint)*.
- **locale** (optional) - let you specify locale to get translated response.
- **projection** (optional) - let you specify what model view to return:
    - onlyId - returns only id
    - default - returns default contract
    - details - returns full contract

Limitations:
- **$top** 100 is max value - the Pull API can't return more than 100 elements in one request.

Defaults:
- if **locale** is not specified, the API will use "en".
- if **$top** operator is not specified, the API set 100
- if **$orderBy** operator is not specified, the API applies default order for specific entity *(more info about possible order you can find here)*. If asc or desc not specified, then the resources will be ordered in ascending order.
- if **projection** is not specified, the API will use "default"

Accepting formats:
- [JSON](https://en.wikipedia.org/wiki/JSON) (application/json) - is a default format which API is using if **Accept** header is omitted.
- [MsgPack](https://msgpack.org/index.html) - (application/msgpack) - is an efficient binary serialization format. It's faster and smaller than JSON and we encourage you use it for production purposes.

Accepting encodings:
- gzip  
- lz4 - fast compression algorithm *(can be used only for MsgPack)*

Examples:
Let's try to query Events endpoint
```http
GET /api/sportsdata/v2/events?query=$filter=sportId eq '1' and isLive eq true&$orderBy=startEventDate&locale=en
Accept: application/json
Accept-Encoding: gzip
Authorization: Bearer {JWT token}
```
The response will provide the current snapshot of the targeted data.
```json
{
    "data": {
        "events": Event[],
        "markets": Market[]
    }
}
```

The definition of Event, Market entities you will find in section Entities Contracts.