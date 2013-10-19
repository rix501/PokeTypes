angular.module('PokeTypes')
.controller 'MainCtrl', ($scope) ->
   
    types = [
        {name: 'Fire'},
        {name: 'Water'},
        {name: 'Grass'}
    ]

    main = types[0]
    other = types[0]

    comparator = (first, second) ->
        first = first.name.toLowerCase()
        second = second.name.toLowerCase()
        
        if first is 'fire'
            switch second
                when 'fire' then 0
                when 'water' then -1
                when 'grass' then 1

        else if first is 'water'
            switch second
                when 'fire' then 1
                when 'water' then 0
                when 'grass' then -1

        else if first is 'grass'
            switch second
                when 'fire' then -1
                when 'water' then 1
                when 'grass' then 0

    update = ->
        return unless main? and other?
        $scope.result = "#{main.name} vs #{other.name} = #{comparator(main, other)}"

    update()

    # scope time

    $scope.selectMain = (thing) ->
        main = thing
        update()

    $scope.selectOther= (thing) ->
        other = thing
        update()

    $scope.types = types
    $scope.mainSelected = main
    $scope.otherSelected = main