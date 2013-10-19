angular.module('PokeTypes')
.service 'Types', () ->

    class Type
        constructor: (@name='') ->
        getWeakness: () -> []
        getEffective: () -> []
        getResistance: () -> []
        getImmunity: () -> []
        comparator: (other) ->
            firstName = @name.toLowerCase()
            secondName = other.name.toLowerCase()
            
            if firstName in other.getImmunity()
                "#{@name} won't affect #{other.name}"

            else if secondName in @getEffective()
                "#{@name} is effective towards #{other.name}"

            else if firstName in other.getResistance()
                "#{@name} isnt effective towards #{other.name}"
                
            else
                "#{@name} damages #{other.name} normally"

    Fire = angular.extend(new Type('Fire'), {
        getEffective: -> ['grass', 'steel', 'bug', 'ice']
        getWeakness: -> ['ground', 'rock', 'water']
        getResistance: -> ['bug', 'steel', 'fire', 'grass', 'ice', 'fairy']
    })

    Water = angular.extend(new Type('Water'), {
        getEffective: -> ['ground', 'rock', 'fire']
        getWeakness: -> ['water', 'electric']
        getResistance: -> ['steel', 'fire', 'water', 'ice']
    })

    Grass = angular.extend(new Type('Grass'), {
        getEffective: -> ['ground', 'rock', 'water']
        getWeakness: -> ['flying', 'poison', 'bug', 'fire', 'ice']
        getResistance: -> ['ground', 'water', 'grass', 'electric']
    })

    Electric = angular.extend(new Type('Electric'), {
        getEffective: -> ['flying', 'water']
        getWeakness: -> ['ground']
        getResistance: -> ['flying', 'electric', 'steel']
    })

    Ground = angular.extend(new Type('Ground'), {
        getEffective: -> ['poison', 'rock', 'steel', 'fire', 'electric']
        getWeakness: -> ['water', 'grass', 'ice']
        getResistance: -> ['poison', 'rock']
        getImmunity: -> ['electric']
    })

    Dragon = angular.extend(new Type('Dragon'), {
        getEffective: -> ['dragon']
        getWeakness: -> ['ice', 'dragon', 'fairy']
        getResistance: -> ['fire', 'water', 'grass', 'electric']
    })

    Ghost = angular.extend(new Type('Ghost'), {
        getEffective: -> ['ghost', 'psychic']
        getWeakness: -> ['ghost', 'dark']
        getResistance: -> ['poison', 'bug']
        getImmunity: -> ['normal', 'fight']
    })

    Normal = angular.extend(new Type('Normal'), {
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