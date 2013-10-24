angular.module('PokeTypes')
.directive 'pokeTypesGrid', ($document) ->
    replace: yes
    templateUrl: 'views/types.html'
    restrict: 'EA'
    scope: 
        types: '='
        show: '='
        model: '='        
    controller: ($scope, $element, $attrs) ->
        $scope.selected = (thing) ->
            'selected' if thing is $scope.model
                
        $scope.select = (thing) ->
            if $scope.model is thing and $attrs.allowEmpty?
                $scope.model = null
            else
                $scope.model = thing