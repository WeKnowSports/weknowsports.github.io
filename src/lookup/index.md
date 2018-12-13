## Lookup API

### Lookup API endpoint

URL path structure:
```http
GET /api/sportsdata/v2/lookup?sportName=...&locale=...
```

Parameters:
- **sportName** (optional) - name of sport.
- **leagueName** (optional) - name of league.
- **eventName** (optional) - name of event.
- **startEventDate** (optional) - start event date, format is yyyyMMdd.
- **locale** (mandatory) - name of sport.

Accepting formats:
- [JSON](https://en.wikipedia.org/wiki/JSON) (application/json) - is a default format which API is using if **Accept** header is omitted.
- [MsgPack](https://msgpack.org/index.html) - (application/msgpack) - is an efficient binary serialization format. It's faster and smaller than JSON and we encourage you use it for production purposes.

Accepting encodings:
- gzip  
- lz4 - fast compression algorithm *(can be used only for MsgPack)*

Examples:
```http
GET /api/sportsdata/v2/lookup?sportName=football&leagueName=mythical-matches&eventName=watford-vs-newcastle&startEventDate=20180829 
Accept: application/json
Accept-Encoding: gzip
Authorization: Bearer {JWT token}
```
The response structure is:
```json
{
    "data": {
        "events": ["id_42"],
        "sports": ["id_1"],
        "leagues": ["id_5"]
    }
}
```