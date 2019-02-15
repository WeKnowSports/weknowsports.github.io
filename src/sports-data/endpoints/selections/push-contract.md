# Selections Push contract

```typescript
{
    //The properties with value null are not returning in contract.
    id: string
    outcomeType: string
    group: number
    name: string
    displayOdds: Dictionary<string>
    trueOdds: number
    isDisabled: Boolean
    metadata: Dictionary
}
```

| Parameter | Description | Format | Returnable | Queryable | Example |
| --- | --- | --- | --- | --- | --- |
| id | Specifies the identifier of the selection. | number | Yes | query (using eq, ne, or, and, in) | $filter=id eq '0HC29147785N250_3' |
|marketId| Specifies the identifier of the selection's market. | string | No | query (using eq, ne, or, and, in) | $filter=marketId eq '2_29147785' |
| outcomeType | Specifies the outcome type implied by the selection. To be used as visualisation and templating helper. For details, see below. | string | Yes | No | -- |
| group |	Relevant for Handicap and Over/Under markets. Groups the selections by point line. For example, "Over 2.5" and "Under 2.5" selections in a market will belong to the same group, "Over 3.5" and "Under 3.5" selections will belong to another group. | number | Yes | No | -- |
| name | Specifies the name of the team/player in the selection. | sting | Yes | No | -- |
| displayOdds | Specifies the odds as they should be displayed in all different styles. See the separate table below for details. | Dictionary | Yes | No | -- |
| trueOdds | Specifies the mathematically correct odds for the selection. Will be -1 for "Starting price" selections, -2 for "Non runner" selections, - 3 for "Without" selections in racing markets. | number | Yes | No | -- |
|points| Specifies the points in the event. | number |	Yes |No | -- |
| isDisabled | Specifies if the selection is available for betting. | Boolean | Yes | No | -- |
| metadata | Dictionary of ad hoc parameters which are not part of the general object model. | Dictionary | Yes |	No | -- |
