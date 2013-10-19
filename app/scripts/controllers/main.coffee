angular.module('PokeTypes')
.controller 'MainCtrl', ($scope, Types) ->
   
    types = Types.list
    main = types[0]
    other = types[0]

    update = -> $scope.result = main.comparator(other)

    update()

    # scope time

    $scope.selectMain = (thing) ->
        main = thing
        update()

    $scope.selectOther = (thing) ->
        other = thing
        update()

    $scope.types = types
    $scope.mainSelected = main
    $scope.otherSelected = main