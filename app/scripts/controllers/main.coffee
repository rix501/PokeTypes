angular.module('PokeTypes')
.controller 'MainCtrl', ($scope, Types) ->

    $scope.types = Types.list
    $scope.main = $scope.types[0]
    $scope.other = $scope.types[0]

    $scope.switch = ->
        main = $scope.other

        $scope.other = $scope.main
        $scope.main = main

    $scope.$watch '[main, other]', ->
        $scope.result = $scope.main.comparator($scope.other)
    , yes