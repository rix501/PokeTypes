angular.module('PokeTypes')
.directive 'pokeTypesGrid', () ->
    replace: yes
    templateUrl: 'views/types.html'
    restrict: 'EA'
    scope: 
        types: '='
        model: '='
    controller: ($scope, $element) ->
        $scope.select = (thing) ->
            $scope.model = thing

