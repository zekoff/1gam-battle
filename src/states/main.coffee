Graph = require('data-structures').Graph
Field = require '../objects/field'
Node = require '../objects/node'
GraphUtils = require '../util/graph_utils'

state = {}

state.create = ->
    graph = new Graph
    field = new Field
    root = new Node
    field.add root
    root.createChildren()
    for n1 in root.getChildren()
        field.add n1
        n1.createChildren()
        for n2 in n1.getChildren()
            field.add n2
            n2.createChildren()
            for n3 in n2.getChildren()
                field.add n3
    field.arrangeNodes root
    game.add.existing field

module.exports = state