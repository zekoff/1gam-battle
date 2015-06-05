Graph = require('data-structures').Graph
Field = require '../objects/field'
Node = require '../objects/node'
GraphUtils = require '../util/graph_utils'

state = {}

state.create = ->
    graph = new Graph
    global.field = new Field
    root = new Node
    field.add root
    root.createChildren 3
    field.arrangeNodes [root]
    for n in root.getChildren(3)
        field.add n
    game.add.existing field

module.exports = state