GraphUtils = require './graph_utils'

fieldData = require '../data/field'

node_input = {}

# Must be bound to a node before using.
node_input.advanceNodes = ->
    @popup?.destroy()
    @ability.action()
    @tint = 0x00FF00
    game.world.setAll '_onscreen', false
    @createChildren 4
    # add all reachable nodes to field
    @_onscreen = true
    for n in @getChildren 4
        game.world.add n
        game.world.add n.edge
        n._onscreen = true
    # remove everything not reachable from @
    # this iterates over edges, too. not desirable
    game.world.forEach (child) ->
        if not child._onscreen and child.key is 'circle'
            child.edge?.kill()
            child.kill()
    GraphUtils.shiftNodes fieldData.root, @
    fieldData.root = @

module.exports = node_input