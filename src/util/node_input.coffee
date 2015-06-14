GraphUtils = require './graph_utils'

fieldData = require '../data/field'

node_input = {}

# Must be bound to a node before using.
node_input.advanceNodes = ->
    @popup?.destroy()
    @ability.action()
    @createChildren 4
    GraphUtils.shiftNodes fieldData.root, @
    fieldData.root = @

module.exports = node_input