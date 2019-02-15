# Selections Pull contract

## Selection object
```typescript
{
    id: string
    entityType: number
    marketId: string
    outcomeType: string
    betslipLine: string
    group: number
    name: string
    title: string
    displayOdds: Dictionary<string>
    trueOdds: number
    points: number
    participantMapping: string
    isDisabled: Boolean
    tags: array
    status: string
    metadata: Dictionary
}
```

| Parameter |	Description | Format | Returnable | Queryable | Example |
| --- | --- | --- | --- | --- | --- |
|id| Specifies the identifier of the selection. | number | Yes | query (using eq, ne, or, and, in) | $filter=id eq '0HC29147785N250_3' |
|entityType| Specifies the entity type. Always 5 for selections. | number | Yes | No | -- |
|marketId| Specifies the identifier of the selection's market. | string | Yes | query (using eq, ne, or, and, in) | $filter=marketId eq '2_29147785' |
|outcomeType| Specifies the outcome type implied by the selection. To be used as visualisation and templating helper. For details, see below. | string | Yes | No | -- |
|betslipLine| Specifies the presentation of the selection in the bet slip. To be used in conjunction with the respective `Market.betslipLine` and `Event.betslipLine` values. | string | Yes | No | -- |
|group|	Relevant for Handicap and Over/Under markets. Groups the selections by point line. For example, "Over 2.5" and "Under 2.5" selections in a market will belong to the same group, "Over 3.5" and "Under 3.5" selections will belong to another group. | number | Yes | No | -- |
|name| Specifies the name of the team/player in the selection. | sting | Yes | No | -- |
|title| Specifies the title of the event. | string | Yes | No | -- |
|displayOdds| Specifies the odds as they should be displayed in all different styles. See the separate table below for details. | Dictionary | Yes | No | -- |
|trueOdds| Specifies the mathematically correct odds for the selection. Will be -1 for "Starting price" selections, -2 for "Non runner" selections, - 3 for "Without" selections in racing markets. | number | Yes | No | -- |
|points| Specifies the points in the event. | number |	Yes | No | -- |
|status| Specifies the status of the selection. Possible values are “Active”, “Disabled”, “NonRunner” (for racing sports).| string | Yes | No | -- |
|participantMapping| Specifies relation of the selection to a specific participant in the event. Used in Outright markets and in some specific market types where two otherwise similar selections are distinguished only by their relation to one of the teams participating in the fixture (for example, "Team goals Odd/Even", where two pairs of "Odd" and "Even" selections are available -- one per team). | string | Yes | No | -- |
|isDisabled| Specifies if the selection is available for betting. | Boolean | Yes | No | -- |
|tags| Specifies additional information for the selection. | array | Yes | No | -- |
|metadata| Dictionary of ad hoc parameters which are not part of the general object model. | Dictionary | Yes |	No | -- |

## outcomeType

The possible values for the @outcomeType@ parameter are meant to provide an internal structure to the markets to facilitate their presentation. In a very general way, you can think of these as grouping selections by column. Of course, for individual market types, different approaches are possible and it is up to the client implementation to choose the best presentation.

Any of the following combinations of @outcomeType@ values are possible inside the various market types:

- Home | Tie | Away (used for Moneylines, Handicaps, Exact scores; multiple home/tie/away selections are possible, in which case you will have to group them additionally by points, group or other properties)
- 1X | X2 | 12 (used for Double chance)
- Over | Exactly | Under (used for Over/Under)
- Yes | No (used for Yes/No markets; multiple yes/no selections are possible, in which case they will need to be paired by some additional criteria like `participantMapping` or `title` properties)
- Odd | Even (used for Odd/Even markets; multiple odd/even selections are possible, in which case they will need to be paired by some additional criteria like `participantMapping` or `title` properties)
- ToScoreFirst | ToScoreLast | ToScoreAnyTime (used for Goalscorer markets)
- ToScoreFirstOrLast | ToScore2OrMore | ToScore3OrMore (used for Goalscorer Premier markets)
- PlaceOnly2 | PlaceOnly3 (used in Place Only markets for Horse racing, to differentiate selections for 2 and 3 places, respectively)

If no @outcomeType@ value is assigned to a selection, this means that there is no inherent structure for the selections inside the respective market. Notably this will be the case for Outrights and many Specials.

## displayOdds

Note that this attribute is nullable, as some special types of selections have no determined odds. Examples would be the "Place" selections (which are dependent on the respective win selection's odds and the Each way terms of the Outright market). In addition, values in all attributes (odds styles) will be "SP" for starting price selections, "NR" for non-runner selections and "W/O" for "without" selections (in "Betting without favourite" markets in racing events).

|Parameter|	Description|Format|Returnable|Queryable|
| --- | --- | --- | --- | --- |
|decimal |Specifies how to display the selection odds in decimal style.|string|Yes |No |
|american |Specifies how to display the selection odds in American style. Note that for negative American odds presentation we tend to use the "MINUS SIGN" "U+2212":http://unicode.org/cldr/utility/character.jsp?a=2212 unicode character to facilitate consistent display layout. You should take special care if you want to process this value as number, which is anyway not recommended and should be avoided. For mathematical operations you should always use the Selection.trueOdds value.|string|Yes |	No |
|fractional |Specifies how to display the selection odds in fractional style.|string|Yes |	No |
|indo |Specifies how to display the selection odds in Indonesian style.|string|Yes |No |
|malay |Specifies how to display the selection odds in Malaysian style.|string|Yes |No |
|hk |Specifies how to display the selection odds in Hong Kong style.|string|Yes |No |

## Tags

| Parameter |	Description |
| --- | --- |
|Place| Indicates that this is a Place selection. These are included into markets where Each way betting is possible and normally should not be displayed to the user. You should rather indicate the Each-way terms on the UI (provided separately in the "placeTermsId" and "oddsTermsId" properties of the Market entity's metadata. |
|SPPlace| Indicates that this is a Special price and Place selection. |
|SP| Indicates that this is a Special price selection. |
|MainPointLine| Specifies the selections representing the main line. |

## Metadata

|Parameter|	Description|Format|Returnable|Queryable|
| --- | --- | --- | --- | --- |
|idSBTech| Legacy identifier exposed for compatibility reasons.|string|	Yes|No|
|previousOddsFractional| "Previous odds" presented in fractional odds style. Served only for fixed price Win selection in Horse racing and Greyhounds races.|string|	Yes|No|
|previousOddsDecimal| "Previous odds" presented in decimal odds style. Served only for fixed price Win selection in Horse racing and Greyhounds races.|string|	Yes|No|
|previousOddsAmerican| "Previous odds" presented in american odds style. Served only for fixed price Win selection in Horse racing and Greyhounds races.|string|	Yes|No|
|runnerStatus| Served for Horse racing and Greyhounds events. Possible values are "Ante-post" (for selections from Ante-post races), "DOE" (for fixed price selections from DOE races), "SP" (for starting price selections from DOE races), "NR" (for selections related to a non-running participant)|string|	Yes|No|
