GraphUtils = require './graph_utils'

node_input = {}

# Must be bound to a node before using.
node_input.advanceNodes = ->
    @popup?.destroy()
    @ability.action()
    fieldData.enemy.act()
    @createChildren 4
    GraphUtils.shiftNodes fieldData.root, @
    fieldData.root = @

module.exports = node_input