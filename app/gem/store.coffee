'use strict'

Reflux = window?.Reflux or require 'reflux'
actions = require './actions'

store = Reflux.createStore
  listenables: actions

  init: -> @isGemActivated = false

  onToggleGem: ->
    @isGemActivated = not @isGemActivated
    @trigger @isGemActivated

module.exports = store
