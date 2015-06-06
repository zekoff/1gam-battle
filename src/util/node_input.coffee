GraphUtils = require './graph_utils'

node_input = {}

# Must be bound to a node before using.
node_input.advanceNodes = ->
    @tint = 0x00FF00
    game.world.setAll '_onscreen', false
    @createChildren 3
    # add all reachable nodes to field
    @_onscreen = true
    for n in @getChildren 3
        game.world.add n
        game.world.add n.edge
        n._onscreen = true
    # remove everything not reachable from @
    # this iterates over edges, too. not desirable
    game.world.forEach (child) ->
        if not child._onscreen and child.key is 'circle'
            child.edge?.kill()
            child.kill()
    GraphUtils.arrangeNodes [@]

module.exports = node_input