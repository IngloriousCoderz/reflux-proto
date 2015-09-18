'use strict'

{toggleGem} = require './actions'
store = require './store'

Gem = React.createClass
  mixins: [Reflux.connect store, 'status']

  onClick: (event) ->
    toggleGem()
    return

  render: ->
    statusStr = if @state?.status then 'activated' else 'deactivated'
    (<div>
      <p>Gem is {statusStr}</p>
      <button onClick={@onClick}>toggle</button>
    </div>)

module.exports = Gem
