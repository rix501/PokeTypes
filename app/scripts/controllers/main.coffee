angular.module('PokeTypes')
.controller 'MainCtrl', ($scope, Types) ->
   
    types = Types.list
    main = types[0]
    other = types[0]
        
    comparator = (first, second) ->
        firstName = first.getName().toLowerCase()
        secondName = second.getName().toLowerCase()
        
        if firstName in second.getImmunity()
            "#{first.getName()} won't affect #{second.getName()}"

        else if secondName in first.getEffective()
            "#{first.getName()} is effective towards #{second.getName()}"

        else if firstName in second.getResistance()
            "#{first.getName()} isnt effective towards #{second.getName()}"
            
        else
            "#{first.getName()} damages normally #{second.getName()}"

    update = ->
        return unless main? and other?
        $scope.result = comparator(main, other)

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