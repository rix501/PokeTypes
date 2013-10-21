angular.module('PokeTypes')
.controller 'MainCtrl', ($scope, Types) ->

    $scope.types = Types.list
    $scope.main = $scope.types[0]
    $scope.other = [ $scope.types[0] ]

    $scope.switch = ->
        main = $scope.other[0]
        
        $scope.other = [$scope.main]
        $scope.main = main

    $scope.$watch '[main, other]', ->
        if $scope.other.length == 1
            $scope.result = $scope.main.comparator($scope.other[0])
        else
            type = $scope.other[0].addType($scope.other[1])
            $scope.result = $scope.main.comparator(type)
    , yes