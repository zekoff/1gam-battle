GraphUtils = require './graph_utils'

node_input = {}

# Must be bound to a node before using.
node_input.advanceNodes = ->
    @popup?.destroy()
    @ability.action()
    @createChildren 4
    GraphUtils.shiftNodes game.field.root, @
    game.field.root = @
    game.enemy.act()
    game.player.endTurn()

module.exports = node_input