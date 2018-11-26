## Time range queries

The Sports Data API supports defining a time range queries via two HTTP query parameters:
 - **from** - it allows limiting the response by specifying the minimum start date.
 - **timeRange** - it allows limiting the response by specifying a time range.

```http
/events?query=...&from=...&timeRange=...
```

### from (query parameter)

it allows limiting the response by specifying the minimum start date of the events. For the events and markets collections, this is straightforward and acts as a filter based on the startDate or startEventDate properties. For leagues, regions and sports it will return only items which are referred by events with start date after the one specified here. This option is valid only when used together with timeRange, otherwise it will have no effect. If left empty, from is assumed to be equal to now, i.e. is dynamic and the time range will be considered to be floating. Alternatively, it accepts a value in ISO 8601 format. We also ignore any time granularity below hours (i.e. if you specify a time like 15:35, we will assume it to equal 15:00
 ```http
 // will return leagues from Soccer which have events 
 // starting during the weekend of Sep 23-24, 2017, 
 // assuming we want to display them to a client using CEST.

 /leagues?query=...&from=2017-09-23T02:00:00Z&timeRange=OneDay
 ```

### timeRange (query parameter)

it allows limiting the response by specifying a time range for the start time of the affected events. For the events and markets collections, this is straightforward and acts as a filter based on the startDate or startEventDate properties. For leagues, regions and sports it will return only items which are referred by events with start date within the specified range. This option supports the following values: OneHour, TwoHours, ThreeHours, SixHours, TwelveHours, OneDay, TwoDays, ThreeDays, SevenDays.
 ```http
 // will return leagues from Soccer which have events 
 // starting within a range of two days from now. 
 // note that this range is dynamic and the query will update,
 // dropping some events from the response and adding others, as the time passes.

 /leagues?query=...&timeRange=SevenDays
 ```