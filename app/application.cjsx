'use strict'

Gem = require 'gem/component'

App =
  init: ->
    React.render <Gem />, document.getElementById 'content'
    return

module.exports = App
