## Selection

```typescript
type Selection = {
    id: string
    outcomeType?: string
    betslipLine: string
    group: number
    name: string
    title?: string
    displayOdds?: Dictionary<string>
    trueOdds: number
    points: number
    participantMapping?: string
    isDisabled: Boolean
    tags: string[]
    metadata: Dictionary
}
```