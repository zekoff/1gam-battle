GraphUtils = require './graph_utils'

node_input = {}

# Must be bound to a node before using.
node_input.advanceNodes = ->
    @popup?.destroy()
    @ability.action()
    game.enemy.act()
    @createChildren 4
    GraphUtils.shiftNodes game.field.root, @
    game.field.root = @

module.exports = node_input