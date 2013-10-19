'use strict'

describe 'Directive: typeButton', () ->

  # load the directive's module
  beforeEach module 'CodeApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<type-button></type-button>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the typeButton directive'
