GraphUtils = require './graph_utils'

fieldData = require '../data/field'

node_input = {}

# Must be bound to a node before using.
node_input.advanceNodes = ->
    @popup?.destroy()
    @ability.action()
    @createChildren 4
    # add all reachable nodes to field
    for n in @getChildren 4
        game.world.add n
        game.world.add n.edge
    GraphUtils.shiftNodes fieldData.root, @
    fieldData.root = @

module.exports = node_input