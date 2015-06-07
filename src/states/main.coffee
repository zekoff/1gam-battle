Node = require '../objects/node'
GraphUtils = require '../util/graph_utils'

state = {}

state.create = ->
    root = new Node
    game.world.add root
    root.createChildren 3
    GraphUtils.arrangeNodes [root]
    for n in root.getChildren 3
        game.world.add n

module.exports = state