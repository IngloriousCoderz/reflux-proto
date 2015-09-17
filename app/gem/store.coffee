'use strict'

actions = require './actions'

store = Reflux.createStore
  listenables: actions

  init: -> @isGemActivated = false

  onToggleGem: ->
    @isGemActivated = not @isGemActivated
    @trigger @isGemActivated

module.exports = store
