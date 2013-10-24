angular.module('PokeTypes')
.controller 'MainCtrl', ($scope, Types) ->

    $scope.types = Types.list
    $scope.main = $scope.types[0]
    $scope.other = [ $scope.types[0] ]

    $scope.otherClass = 'none'
    $scope.otherName = '?'

    $scope.switchTypes = ->
        main = $scope.other[0]
        
        $scope.other = [$scope.main]
        $scope.main = main

    $scope.picker = (type)->
        if type is 'main'
            $scope.showMainPicker = !$scope.showMainPicker
            $scope.showOther1Picker = no
            $scope.showOther2Picker = no

        else if type is 'other1'
            $scope.showOther1Picker = !$scope.showOther1Picker
            $scope.showMainPicker = no
            $scope.showOther2Picker = no

        else if type is 'other2'
            $scope.showOther2Picker = !$scope.showOther2Picker
            $scope.showMainPicker = no
            $scope.showOther1Picker = no

    $scope.$watch '[main, other]', ->
        if $scope.other.length == 1 or not $scope.other[1]?
            $scope.result = $scope.main.comparator($scope.other[0])
            $scope.otherValue = $scope.other[0].value()
            $scope.otherClass = 'none'
            $scope.otherName = '?'
        else
            type = $scope.other[0].addType($scope.other[1])
            $scope.result = $scope.main.comparator(type)
            $scope.otherValue = type.value()
            $scope.otherClass = $scope.other[1].name.toLowerCase()
            $scope.otherName = $scope.other[1].name
    , yes