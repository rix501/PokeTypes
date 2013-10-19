'use strict'

describe 'Service: Types', () ->

  # load the service's module
  beforeEach module 'PoketypesApp'

  # instantiate service
  Types = {}
  beforeEach inject (_Types_) ->
    Types = _Types_

  it 'should do something', () ->
    expect(!!Types).toBe true
