'use strict'

jest.dontMock '../gem/actions'
jest.dontMock '../gem/component'

React = require 'react/addons'
{toggleGem} = require '../gem/actions'
Gem = require '../gem/component'
TestUtils = React.addons.TestUtils

###
Reflux/React test suites.

Note how we used actions to trigger events: in fact, using some
TestUtils.Simulate.click() or calling component.onClick() don't work at all in
a Reflux environment, since everything here became an async call. Besides,
the toggleGem().then(doSth) syntax is really neat.
###

###
This first test suite uses the old renderIntoDocument() method, which is quite
heavy for unit tests as it relies on a detached DOM node in the document
apparently (which one though?).
###
describe 'Gem test', ->
  beforeEach ->
    gem = TestUtils.renderIntoDocument <Gem />
    @renderedDOM = -> React.findDOMNode gem
    return

  it 'should have two children', ->
    expect(@renderedDOM().children.length).toBe 2
    return

  it 'should respond to actions', ->
    statusLabel = @renderedDOM().querySelectorAll('p')[0]
    expect(statusLabel.textContent).toEqual 'Gem is deactivated'

    toggleGem().then ->
      expect(statusLabel.textContent).toEqual 'Gem is activated'
      return
    return

###
The second test suite behaves just like the first one, but uses TestUtil's
shallow renderer. The big difference here is that we can't rely on DOM
manipulation, so we must traverse each component's properties (with curious
side effects such as having two children for the paragraph).

Here we are querying position-based, which is terrible. I couldn't find a way
to query through refs or other methods.
###
describe 'Gem shallow test', ->
  beforeEach ->
    renderer = TestUtils.createRenderer()
    renderer.render <Gem />
    @gem = renderer.getRenderOutput()
    return

  it 'should have two children as well', ->
    expect(@gem.props.children.length).toBe 2
    return

  it 'should respond to actions as well', ->
    statusLabel = @gem.props.children[0]
    expect(statusLabel.props.children[1]).toEqual 'deactivated'

    toggleGem().then ->
      expect(statusLabel.props.children[1]).toEqual 'activated'
    return
