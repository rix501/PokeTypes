angular.module('PokeTypes')
.controller 'MainCtrl', ($scope, Types) ->

    $scope.types = Types.list
    $scope.main = $scope.types[0]
    $scope.other = $scope.types[0]

    updateResult = ->
        $scope.result = $scope.main.comparator($scope.other)

    $scope.$watch 'main', updateResult
    $scope.$watch 'other', updateResult