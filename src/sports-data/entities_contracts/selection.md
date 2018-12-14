## Selection

```typescript
export interface Selection {
    id: string

    outcomeType: OutcomeType | null

    group: number

    name: string

    title: string | null

    betslipLine: string

    participantMapping: string | null

    displayOdds: Dictionary<string>

    trueOdds: number

    points: number | null

    /* Win or Place for outrights */
    tags: string[]

    /* idsbtech: string */
    metadata: Dictionary<any>

    isDisabled: boolean

    entityType: EntityType

    marketId: string
}

export interface SelectionChange {
    id: string,    
    displayOdds: Dictionary<string>,
    trueOdds: number,
    isDisabled: boolean,
    metadata: Dictionary<any>
}

export enum OutcomeType {
    Home = "Home",
    Tie = "Tie",
    Draw = "Draw",
    Away = "Away",
    OneOrX = "1X",
    XOrTwo = "X2",
    OneTwo = "12",
    Over = "Over",
    Exactly = "Exactly",
    Under = "Under",
    Yes = "Yes",
    No = "No",
    Odd = "Odd",
    Even = "Even",
    ToScoreFirst = "ToScoreFirst",
    ToScoreLast = "ToScoreLast",
    ToScoreAnyTime = "ToScoreAnyTime",
    ToScoreFirstOrLast = "ToScoreFirstOrLast",
    ToScore2OrMore = "ToScore2OrMore",
    ToScore3OrMore = "ToScore3OrMore"
}
```