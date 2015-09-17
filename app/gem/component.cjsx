actions = require './actions'
store = require './store'

Gem = React.createClass
  componentDidMount: ->
    @unsubscribe = store.listen @onGemChange

  componentWillUnmount: ->
    @unsubscribe()

  onGemChange: (status) ->
    @setState status: status

  onClick: (event) ->
    actions.toggleGem()

  render: ->
    statusStr = if @state?.status then 'activated' else 'deactivated'
    (
      <p>
        Gem is {statusStr} &nbsp;
        <button onClick={@onClick}>toggle</button>
      </p>
    )

module.exports = Gem
