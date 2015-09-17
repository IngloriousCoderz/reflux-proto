'use strict'

actions = require './actions'

store = Reflux.createStore
  init: ->
    @isGemActivated = false
    @listenTo actions.toggleGem, @handleToggleGem

  handleToggleGem: ->
    @isGemActivated = not @isGemActivated
    @trigger @isGemActivated

module.exports = store
