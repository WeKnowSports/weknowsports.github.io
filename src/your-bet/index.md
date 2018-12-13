## Your Bet API

### Your Bet API endpoint

URL path structure:
```http
GET /api/sportsdata/v2/yourbet?eventId=...&selections=...
```

Parameters:
- **eventId** (mandatory) - id of event. 
- **selections** (mandatory) - array of selections id's.

Accepting formats:
- [JSON](https://en.wikipedia.org/wiki/JSON) (application/json) - is a default format which API is using if **Accept** header is omitted.
- [MsgPack](https://msgpack.org/index.html) - (application/msgpack) - is an efficient binary serialization format. It's faster and smaller than JSON and we encourage you use it for production purposes.

Accepting encodings:
- gzip  
- lz4 - fast compression algorithm *(can be used only for MsgPack)*

Examples:
```http
GET /api/sportsdata/v2/yourbet?eventId=12107641&selections=0ML32377171_2,0ML32377151_3
Accept: application/json
Accept-Encoding: gzip
Authorization: Bearer {JWT token}
```
The response is:
```json
{
  "data": {
    "eligibleMarkets": [
        {
            "id": "52884113",
            "selectionIds": [
                "0QA52884113#612339879_2L41410Q13Q23",
                "0QA52884113#612339857_2L41410Q11Q21",
                "0QA52884113#612339846_2L41410Q10Q20",
                "0QA52884113#612339868_2L41410Q12Q22"
            ]
        },
        {
            "id": "3_32641323",
            "selectionIds": [
                "0OU32641323U350_3",
                "0OU32641323O350_1"
            ]
        }        
    ],    
    "selectionsMapped": [
      "0ML32377171_2"
    ],
    "trueOdds": 3.5,
    "displayOdds": {
      "american": "+250",
      "decimal": "3.50",
      "fractional": "5/2",
      "hk": "2.50",
      "indo": "2.50",
      "malay": "-0.40"
    }
  }
}
```