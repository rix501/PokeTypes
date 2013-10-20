angular.module('PokeTypes')
.service 'Types', () ->

    defaults = (dest, def) -> angular.extend(angular.copy(def),dest)

    Type =
        name: ''
        weakness: []
        effective: []
        resistance: []
        immunity: []
        comparator: (other) ->
            firstName = @name.toLowerCase()
            secondName = other.name.toLowerCase()
            
            if firstName in other.immunity
                "#{@name} won't affect #{other.name}"

            else if secondName in @effective
                "#{@name} is super-effective towards #{other.name}"

            else if firstName in other.resistance
                "#{@name} isn't effective towards #{other.name}"
                
            else
                "#{@name} is effective towards #{other.name}"

    Fire = angular.extend(angular.copy(Type), {
        name: 'Fire'
        effective: ['grass', 'steel', 'bug', 'ice']
        weakness: ['ground', 'rock', 'water']
        resistance: ['bug', 'steel', 'fire', 'grass', 'ice', 'fairy']
    })

    Water = angular.extend(angular.copy(Type), {
        name: 'Water'
        effective: ['ground', 'rock', 'fire']
        weakness: ['water', 'electric']
        resistance: ['steel', 'fire', 'water', 'ice']
    })

    Grass = angular.extend(angular.copy(Type), {
        name: 'Grass'
        effective: ['ground', 'rock', 'water']
        weakness: ['flying', 'poison', 'bug', 'fire', 'ice']
        resistance: ['ground', 'water', 'grass', 'electric']
    })

    Electric = angular.extend(angular.copy(Type), {
        name: 'Electric'
        effective: ['flying', 'water']
        weakness: ['ground']
        resistance: ['flying', 'electric', 'steel']
    })

    Ground = angular.extend(angular.copy(Type), {
        name: 'Ground'
        effective: ['poison', 'rock', 'steel', 'fire', 'electric']
        weakness: ['water', 'grass', 'ice']
        resistance: ['poison', 'rock']
        immunity: ['electric']
    })

    Dragon = angular.extend(angular.copy(Type), {
        name: 'Dragon'
        effective: ['dragon']
        weakness: ['ice', 'dragon', 'fairy']
        resistance: ['fire', 'water', 'grass', 'electric']
    })

    Ghost = angular.extend(angular.copy(Type), {
        name: 'Ghost'
        effective: ['ghost', 'psychic']
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
        effective: ['grass', 'ground', 'flying', 'dragon']
        weakness: ['fire', 'fighting', 'rock', 'steel']
        resistance: ['ice']
    })

    Fighting = angular.extend(angular.copy(Type), {
        name: 'Fighting'
        effective: ['normal', 'ice', 'rock', 'dark', 'steel']
        weakness: ['flying', 'psychic', 'fairy']
        resistance: ['bug', 'rock', 'dark']
    })

    Poison = angular.extend(angular.copy(Type), {
        name: 'Poison'
        effective: ['grass', 'fairy']
        weakness: ['ground', 'psychic']
        resistance: ['grass', 'fighting', 'poison', 'bug', 'fairy']
    })

    Flying = angular.extend(angular.copy(Type), {
        name: 'Flying'
        effective: ['grass', 'fighting', 'bug']
        weakness: ['electric', 'ice', 'rock']
        resistance: ['grass', 'fighting', 'bug']
        immunity: ['ground']
    })

    Psychic = angular.extend(angular.copy(Type), {
        name: 'Psychic'
        effective: ['fighting', 'poison']
        weakness: ['bug', 'ghost', 'dark']
        resistance: ['fighting', 'psychic']
    })

    Bug = angular.extend(angular.copy(Type), {
        name: 'Bug'
        effective: ['grass', 'effective', 'dark']
        weakness: ['fire', 'flying', 'rock']
        resistance: ['grass', 'fighting', 'ground']
    })

    Rock = angular.extend(angular.copy(Type), {
        name: 'Rock'
        effective: ['fire', 'ice', 'flying', 'bug']
        weakness: ['water', 'grass', 'fighting', 'ground', 'steel']
        resistance: ['normal', 'fire', 'poison', 'flying']
    })

    Dark = angular.extend(angular.copy(Type), {
        name: 'Dark'
        effective: ['psychic', 'ghost']
        weakness: ['fighting', 'bug', 'fairy']
        resistance: ['ghost', 'dark']
        immunity: ['psychic']
    })

    Steel = angular.extend(angular.copy(Type), {
        name: 'Steel'
        effective: ['ice', 'rock', 'dragon']
        weakness: ['fighting', 'fire', 'ground']
        resistance: ['normal', 'grass', 'ice', 'flying', 'psychic', 'bug', 'rock', 'dragon', 'steel', 'fairy']
        immunity: ['poison']
    })

    Fairy = angular.extend(angular.copy(Type), {
        name: 'Fairy'
        effective: ['fighting', 'dragon', 'dark']
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