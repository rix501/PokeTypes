angular.module('PokeTypes')
.directive 'pokeTypesGrid', () ->
    replace: yes
    templateUrl: 'views/types.html'
    restrict: 'EA'
    scope: 
        types: '='
        model: '='
    controller: ($scope, $element) ->
        $scope.selected = (thing) ->
            if (angular.isArray($scope.model) and thing in $scope.model) or thing is $scope.model
                'selected'

        $scope.select = (thing) ->
            if angular.isArray($scope.model)
                # @TODO: this leads to some weird UX, fix it
                if $scope.model.length == 2
                    if thing in $scope.model
                        $scope.model.splice($scope.model.indexOf(thing), 1)
                    else
                        $scope.model.shift()
                        $scope.model.push(thing)
                        
                else if thing not in $scope.model
                    $scope.model.push(thing)

            else
                $scope.model = thing