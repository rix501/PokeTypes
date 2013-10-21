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

    Fire = defaults({
        name: 'Fire'
        weakness: ['ground', 'rock', 'water']
        resistance: ['bug', 'steel', 'fire', 'grass', 'ice', 'fairy']
    }, Type)

    Water = defaults({
        name: 'Water'
        weakness: ['electric', 'grass']
        resistance: ['steel', 'fire', 'water', 'ice']
    }, Type)

    Grass = defaults({
        name: 'Grass'
        weakness: ['flying', 'poison', 'bug', 'fire', 'ice']
        resistance: ['ground', 'water', 'grass', 'electric']
    }, Type)

    Electric = defaults({
        name: 'Electric'
        weakness: ['ground']
        resistance: ['flying', 'electric', 'steel']
    }, Type)

    Ground = defaults({
        name: 'Ground'
        weakness: ['water', 'grass', 'ice']
        resistance: ['poison', 'rock']
        immunity: ['electric']
    }, Type)

    Dragon = defaults({
        name: 'Dragon'
        weakness: ['ice', 'dragon', 'fairy']
        resistance: ['fire', 'water', 'grass', 'electric']
    }, Type)

    Ghost = defaults({
        name: 'Ghost'
        weakness: ['ghost', 'dark']
        resistance: ['poison', 'bug']
        immunity: ['normal', 'fight']
    }, Type)

    Normal = defaults({
        name: 'Normal'
        weakness: ['fight']
        immunity: ['ghost']
    }, Type)

    Ice = defaults({
        name: 'Ice'
        weakness: ['fire', 'fighting', 'rock', 'steel']
        resistance: ['ice']
    }, Type)

    Fighting = defaults({
        name: 'Fighting'
        weakness: ['flying', 'psychic', 'fairy']
        resistance: ['bug', 'rock', 'dark']
    }, Type)

    Poison = defaults({
        name: 'Poison'
        weakness: ['ground', 'psychic']
        resistance: ['grass', 'fighting', 'poison', 'bug', 'fairy']
    }, Type)

    Flying = defaults({
        name: 'Flying'
        weakness: ['electric', 'ice', 'rock']
        resistance: ['grass', 'fighting', 'bug']
        immunity: ['ground']
    }, Type)

    Psychic = defaults({
        name: 'Psychic'
        weakness: ['bug', 'ghost', 'dark']
        resistance: ['fighting', 'psychic']
    }, Type)

    Bug = defaults({
        name: 'Bug'
        weakness: ['fire', 'flying', 'rock']
        resistance: ['grass', 'fighting', 'ground']
    }, Type)

    Rock = defaults({
        name: 'Rock'
        weakness: ['water', 'grass', 'fighting', 'ground', 'steel']
        resistance: ['normal', 'fire', 'poison', 'flying']
    }, Type)

    Dark = defaults({
        name: 'Dark'
        weakness: ['fighting', 'bug', 'fairy']
        resistance: ['ghost', 'dark']
        immunity: ['psychic']
    }, Type)

    Steel = defaults({
        name: 'Steel'
        weakness: ['fighting', 'fire', 'ground']
        resistance: ['normal', 'grass', 'ice', 'flying', 'psychic', 'bug', 'rock', 'dragon', 'steel', 'fairy']
        immunity: ['poison']
    }, Type)

    Fairy = defaults({
        name: 'Fairy'
        weakness: ['poison', 'steel']
        resistance: ['fighting', 'dark', 'bug']
        immunity: ['dragon']
    }, Type)

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