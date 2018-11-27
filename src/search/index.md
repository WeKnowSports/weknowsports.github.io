## Search API

### General overview

Search API provides simple multi-language search capabilities over sports data content. You will be able to search for event.name, league.name, sport.name in one request. Search API is applying 'startWith' for the whole sentence. For example we have a team **"Real Madrid"**:
- user entered **"Mad"** - **"Real Madrid"** will be found
- user entered **"Rea"** - **"Real Madrid"** will be found
- user entered **"drid"** - not found
- user entered **"Medrid"** - not found

### Search API endpoint

URL path structure:
```http
GET /api/sportsdata/v2/search?query=...&locale=...
```

Parameters:
- **query** (mandatory) - the URL encoded query string, will be applied to eventName, leagueName, sportName. 
- **locale** (mandatory) - the locale for translation. If the locale is not supported for the specific operator then a HTTP (400) BadRequest is returned.
- **top** (optional) - the number of entities to return.

Limitations:
- **query** - 50 characters is maximum and 3 characters is minimum query length.
- **top** - 40 elements per array is maximum to return.

Defaults:
- if **top** is not specified, the API will use 20.

Accepting formats:
- [JSON](https://en.wikipedia.org/wiki/JSON) (application/json) - is a default format which API is using if **Accept** header is omitted.

Accepting encodings:
- gzip  

Examples:
Let's try to search: Real Madrid. First, we need to URL encode the query: Real Madrid -> Real20%Madrid. Now, we are ready to send a query with specified locale.
```http
GET /api/sportsdata/v2/search?query=Real20%Madrid&top=10&locale=en
Accept: application/json
Accept-Encoding: gzip
Authorization: Bearer {JWT token}
```
The response is:
```json
{
    "data": {
        "events": Event[],
        "sports": Sport[],   
        "leagues": League[]
    }
}
```