## Validation rules

### Global rules
| Description | Example |
|---|---|
| the maximum possible length of a whole query string is 1500 chars | /events?query=...&includeMarkets...&projection=... |

### HTTP parameter: query 

| OData operator | Description | Example | 
|---|---|---|
| **$filter** | can't be empty                           | $filter=                                     |
| **$filter** | can have no more than 2 **or** operators | $filter=id eq '1' or id eq '2' or id eq '3'  |
| **$filter** | can have no more than 2 **in** operators | $filter=id in('1', '2') or id in ('3', '4') |
| **$top**    | 100 is max value                         | $top=200 |


### HTTP parameter: includeMarkets

| OData operator | Description | Example | 
|---|---|---|
| **$filter** | can be empty ($filter=) only in case if client query Event by id, in this case the API will return all markets for specific event without **$top=100** limitation | $filter= |
| **$filter** | can query only marketType.id and marketType.name | $filter=marketType/id eq '1_39' or marketType/name eq 'Live Betting 1X2' |
| **$filter** | can't query no more than 3 market types | $filter=marketType/id in ('1', '2', '3') |
| **$filter** | can't return more than 300 markets in one response | $filter=marketType/id in ('1', '2', '3') |
| **$top**    | can't be specified | $top=10 |
| **$skip**   | can't be specified | $skip=10 |

### Supported OData operators
| OData operator | Status | 
|---|---|
| $filter        | Supported |
| $top           | Supported |
| $skip          | Supported |
| $orderBy       | Supported |
| $expand        | Not supported |
| $inlinecount   | Not supported |
| $select        | Not supported |
| $search        | Not supported |
| $format        | Not supported |
| $compute       | Not supported |
| $index         | Not supported |
| $schemaversion | Not supported |
| $count         | Not supported |
