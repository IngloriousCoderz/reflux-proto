'use strict'

#jest.dontMock '../application'

describe 'truthness', ->
  it 'should be true', ->
    expect(true).toBeTruthy()
    return

  xit 'should be left pending', ->
    expect(true).not.toBeFalsy()
    return
