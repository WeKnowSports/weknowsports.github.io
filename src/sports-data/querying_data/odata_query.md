## OData query

A query is part of a URL that is used to request specific data. We use OData query format (not protocol) with some limitations and enhancements, as described below. The OData query format represents a composition of several standard and custom query options. Usually you will work with: **$filter, $orderby, $top, $skip** query operators

```http
// OData query format
$filter={expression}&$top={int}&$skip={int}&$orderBy={expression}

// a very basic query to get live games
/events?query=$filter=islive eq true 

// an example where we compose: $filter, $orderby and $top query operators
/events?query=$filter=sportId eq '6' and isLive eq true&$orderby=startEventDate&$top=100
```

> Any OData query should be URL encoded before being sent. Note that we will not encode the samples in this documentation to improve readability, but you should remember to do it consistently in your code.

```http
$filter=islive eq true         // OData query without URL encoding
%24filter%3Dislive%20eq%20true // OData query with URL encoding
```

The Sports Data TypeScript client will provide this encoding out of the box, if you use it in your implementation. Many HTTP libraries also have this option.

### $filter operator
Allows clients to filter a collection of resources that are addressed by a request URL. $filter supports following options

| Operator | Description | Example | 
|---|---|---|
| eq | Equal (==) | $filter=sportId eq '1' |
| ne | Not equal (!=) | $filter=sportId ne '1' |
| lt | Less than (<) | - |
| le | Less than or equal (<=) | - |
| gt | Greater than (>) | - |
| ge | Greater than or equal (>=) | - |
| and | Logical and (&&) | $filter=sportId eq '1' and leagueId eq '13761' |
| or  | Logical or (\|\|) | $filter=sportId eq '1' or sportId eq '5'  |

### $top operator
Allows requesting a specific number of top results to be included in the result.
```http
 $filter=sportId eq '1'&$top=4
```

### $skip operator
Allows requesting a number of items to be skipped and not included in the result.
```http
$filter=sportId eq '1'&$top=10&$skip=10
```

### $orderby operator
Allows requesting resources in either ascending or descending order (asc or desc, respectively). If asc or desc is not specified, then the resources will be ordered in ascending order.
```http
$filter=(isLive eq false) and sportId eq '6'&top=10&$orderby=totalBets desc
```

### lamda operator
Allows to express filters (any or all) based on the contents of a collection. 

```http
// filter events which has value 'Streaming' in Tags array.
$filter=Tags/any(x: x eq 'Streaming')
```

### querying by a nested property
OData allows querying by a nested property. This means that you can filter a list of entities based on a property of an object, which is itself as a value for a property of the main entity.
```http
/markets?query=$filter=marketType/id eq '1_39'
```