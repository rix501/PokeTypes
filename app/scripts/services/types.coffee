angular.module('PokeTypes')
.service 'Types', () ->

    defaults = (dest, def) -> angular.extend(angular.copy(def),dest)

    Type =
        name: ''
        weakness: []
        resistance: []
        superWeakness: []
        superResistance: []
        immunity: []
        value: ->
            total = 0
            superWeaknessValue = 4
            weaknessValue = 2
            resistanceValue = 1/2
            superResistanceValue = 1/4
            immunityValue = 0

            totalTypes = 18
            normal = totalTypes - [].concat(@weakness, @resistance, @superWeakness, @superResistance, @immunity).length

            total += @weakness.length * weaknessValue
                
            total += @resistance.length * resistanceValue

            total += @superWeakness.length * superWeaknessValue

            total += @superResistance.length * superResistanceValue

            total += normal

            total

        combineStats: (stats, origStats, superStats, otherStats) ->
            for thing in stats
                if thing not in @immunity
                    if thing in origStats
                        origStats.splice(origStats.indexOf(thing), 1)
                        superStats.push(thing)
                    else if thing in otherStats
                        otherStats.splice(otherStats.indexOf(thing), 1)
                    else
                        origStats.push(thing)

            undefined

        combineWeakness: (stats) ->
            @combineStats(stats, @weakness, @superWeakness, @resistance)

        combineResistance: (stats) ->
            @combineStats(stats, @resistance, @superResistance, @weakness)

        addType: (other) ->
            type = angular.copy(@)

            type.name = "#{type.name} + #{other.name}"

            type.combineWeakness(other.weakness)

            type.combineResistance(other.resistance)
            
            for thing in other.immunity
                if thing in type.resistance
                    type.resistance.splice(type.resistance.indexOf(thing), 1)
                if thing in type.weakness
                    type.weakness.splice(type.weakness.indexOf(thing), 1)
                
                type.immunity.push(thing) if thing not in type.immunity

            type

        comparator: (other) ->
            firstName = @name.toLowerCase()
            secondName = other.name.toLowerCase()
            
            text = if firstName in other.immunity
                "won't affect"

            else if firstName in other.weakness
                "is 2x effective towards"

            else if firstName in other.superWeakness
                "is 4x effective towards"

            else if firstName in other.resistance
                "is 1/2 effective towards"

            else if firstName in other.superResistance
                "is 1/4 effective towards"
                
            else
                "is effective towards"

            "#{@name} (#{@value()}) #{text} #{other.name} (#{other.value()})"

    Fire = angular.extend(angular.copy(Type), {
        name: 'Fire'
        weakness: ['ground', 'rock', 'water']
        resistance: ['bug', 'steel', 'fire', 'grass', 'ice', 'fairy']
    })

    Water = angular.extend(angular.copy(Type), {
        name: 'Water'
        weakness: ['electric', 'grass']
        resistance: ['steel', 'fire', 'water', 'ice']
    })

    Grass = angular.extend(angular.copy(Type), {
        name: 'Grass'
        weakness: ['flying', 'poison', 'bug', 'fire', 'ice']
        resistance: ['ground', 'water', 'grass', 'electric']
    })

    Electric = angular.extend(angular.copy(Type), {
        name: 'Electric'
        weakness: ['ground']
        resistance: ['flying', 'electric', 'steel']
    })

    Ground = angular.extend(angular.copy(Type), {
        name: 'Ground'
        weakness: ['water', 'grass', 'ice']
        resistance: ['poison', 'rock']
        immunity: ['electric']
    })

    Dragon = angular.extend(angular.copy(Type), {
        name: 'Dragon'
        weakness: ['ice', 'dragon', 'fairy']
        resistance: ['fire', 'water', 'grass', 'electric']
    })

    Ghost = angular.extend(angular.copy(Type), {
        name: 'Ghost'
        weakness: ['ghost', 'dark']
        resistance: ['poison', 'bug']
        immunity: ['normal', 'fight']
    })

    Normal = angular.extend(angular.copy(Type), {
        name: 'Normal'
        weakness: ['fight']
        immunity: ['ghost']
    })

    Ice = angular.extend(angular.copy(Type), {
        name: 'Ice'
        weakness: ['fire', 'fighting', 'rock', 'steel']
        resistance: ['ice']
    })

    Fighting = angular.extend(angular.copy(Type), {
        name: 'Fighting'
        weakness: ['flying', 'psychic', 'fairy']
        resistance: ['bug', 'rock', 'dark']
    })

    Poison = angular.extend(angular.copy(Type), {
        name: 'Poison'
        weakness: ['ground', 'psychic']
        resistance: ['grass', 'fighting', 'poison', 'bug', 'fairy']
    })

    Flying = angular.extend(angular.copy(Type), {
        name: 'Flying'
        weakness: ['electric', 'ice', 'rock']
        resistance: ['grass', 'fighting', 'bug']
        immunity: ['ground']
    })

    Psychic = angular.extend(angular.copy(Type), {
        name: 'Psychic'
        weakness: ['bug', 'ghost', 'dark']
        resistance: ['fighting', 'psychic']
    })

    Bug = angular.extend(angular.copy(Type), {
        name: 'Bug'
        weakness: ['fire', 'flying', 'rock']
        resistance: ['grass', 'fighting', 'ground']
    })

    Rock = angular.extend(angular.copy(Type), {
        name: 'Rock'
        weakness: ['water', 'grass', 'fighting', 'ground', 'steel']
        resistance: ['normal', 'fire', 'poison', 'flying']
    })

    Dark = angular.extend(angular.copy(Type), {
        name: 'Dark'
        weakness: ['fighting', 'bug', 'fairy']
        resistance: ['ghost', 'dark']
        immunity: ['psychic']
    })

    Steel = angular.extend(angular.copy(Type), {
        name: 'Steel'
        weakness: ['fighting', 'fire', 'ground']
        resistance: ['normal', 'grass', 'ice', 'flying', 'psychic', 'bug', 'rock', 'dragon', 'steel', 'fairy']
        immunity: ['poison']
    })

    Fairy = angular.extend(angular.copy(Type), {
        name: 'Fairy'
        weakness: ['poison', 'steel']
        resistance: ['fighting', 'dark', 'bug']
        immunity: ['dragon']
    })

    @list = [
        Fire,
        Water,
        Grass,
        Electric,
        Ground,
        Dragon,
        Ghost,
        Normal,
        Ice,
        Fighting,
        Poison,
        Flying,
        Psychic,
        Bug,
        Rock,
        Dark,
        Steel,
        Fairy
    ]

    undefined