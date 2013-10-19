angular.module('PokeTypes')
.service 'Types', () ->

    class Type
        getName: () -> ''
        getWeakness: () -> []
        getEffective: () -> []
        getResistance: () -> []
        getImmunity: () -> []

    Fire = angular.extend(new Type, {
        getName: -> 'Fire'
        getEffective: -> ['grass', 'steel', 'bug', 'ice']
        getWeakness: -> ['ground', 'rock', 'water']
        getResistance: -> ['bug', 'steel', 'fire', 'grass', 'ice', 'fairy']
    })

    Water = angular.extend(new Type, {
        getName: -> 'Water'
        getEffective: -> ['ground', 'rock', 'fire']
        getWeakness: -> ['water', 'electric']
        getResistance: -> ['steel', 'fire', 'water', 'ice']
    })

    Grass = angular.extend(new Type, {
        getName: -> 'Grass'
        getEffective: -> ['ground', 'rock', 'water']
        getWeakness: -> ['flying', 'poison', 'bug', 'fire', 'ice']
        getResistance: -> ['ground', 'water', 'grass', 'electric']
    })

    Electric = angular.extend(new Type, {
        getName: -> 'Electric'
        getEffective: -> ['flying', 'water']
        getWeakness: -> ['ground']
        getResistance: -> ['flying', 'electric', 'steel']
    })

    Ground = angular.extend(new Type, {
        getName: -> 'Ground'
        getEffective: -> ['poison', 'rock', 'steel', 'fire', 'electric']
        getWeakness: -> ['water', 'grass', 'ice']
        getResistance: -> ['poison', 'rock']
        getImmunity: -> ['electric']
    })

    Dragon = angular.extend(new Type, {
        getName: -> 'Dragon'
        getEffective: -> ['dragon']
        getWeakness: -> ['ice', 'dragon', 'fairy']
        getResistance: -> ['fire', 'water', 'grass', 'electric']
    })

    Ghost = angular.extend(new Type, {
        getName: -> 'Ghost'
        getEffective: -> ['ghost', 'psychic']
        getWeakness: -> ['ghost', 'dark']
        getResistance: -> ['poison', 'bug']
        getImmunity: -> ['normal', 'fight']
    })

    Normal = angular.extend(new Type, {
        getName: -> 'Normal'
        getWeakness: -> ['fight']
        getImmunity: -> ['ghost']
    })

    @list = [
        Fire,
        Water,
        Grass,
        Electric,
        Ground,
        Dragon,
        Ghost,
        Normal
    ]

    undefined