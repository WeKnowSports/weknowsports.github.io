## Push API

The Push API should be used to create a subscription based on query and listen on updates. For defining a query the API use OData as a query format (more info about OData supports you can find here). In addition to creating a subscription you also can retrieve initial data and then subscribe on updates in one request, you will find more info about this in the last section. 

> The main difference in terms of querying between Pull API and Push API is that in Push API the query is limited to **$filter** only, you can send the only **$filter** which is a query without **$top, $skip, $orderBy** operators.

> Any OData query should be URL encoded before being sent. Note that we will not encode the samples in this documentation to improve readability, but you should remember to do it consistently in your code.

URL path structure:
```http
GET /api/sportsdata/v2/stream/{entity}/?query=...&locale=...
```

Possible entities:
- events
- markets
- selections
- sports
- leagues
- regions

Parameters:
- **query** (mandatory) - target OData filter. Here is a list of supported OData operators:
    - **$filter** - allows clients to filter a collection of resources that are addressed by a request URL.     
- **from** (optional)
- **timeRange** (optional)
- **includeMarkets** (optional) - additional OData query parameter to include markets for events (*could be used only for Events endpoint)*.
- **initialData** - let you get initial snapshot with subscription in one request. 
- **locale** (optional) - let you specify locale to get translated response.
- **projection** (optional) - let you specify what model view to return:
    - onlyId - returns only id
    - default - returns default contract
    - details - returns full contract

Limitations:
- in case if **initialData=true** the Push API can't return more than 100 elements in one request.

Defaults:
- if **locale** is not specified, the API will use "en".
- if **projection** is not specified, the API will use "default"

Accepting formats:
- [SSE](https://en.wikipedia.org/wiki/Server-sent_events) (text/event-stream) - is enabling a browser to receive automatic updates from a server via HTTP connection
- [JSON](https://en.wikipedia.org/wiki/JSON) (application/json) - is a default format which API is using if **Accept** header is omitted.
- [MsgPack](https://msgpack.org/index.html) - (application/msgpack) - is an efficient binary serialization format. It's faster and smaller than JSON and we encourage you use it for production purposes.

Accepting encodings:
- gzip
- lz4 - fast compression algorithm *(can be used only for MsgPack)*

Examples:
Let's try to subscribe on Events endpoint
```http
GET /api/sportsdata/v2/stream/events?query=$filter=sportId eq '1' and isLive eq true&locale=en
Accept: text/event-stream, application/json
Accept-Encoding: gzip
Authorization: Bearer {JWT token}
```
After establishing the subscription you will start receiving updates. The response will provide the list of collections: add, remove, change.
```
{
    data: {
        add: {
            events: [],
            markets: []
        },
        remove: {
            events: ["id1", "id2"],
            markets: ["id1", "id2"]
        },
        change: {
            events: [],
            markets: []
        }
    }
}
```